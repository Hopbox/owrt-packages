#!/usr/bin/perl

#use strict;
#use warnings;
#use Data::Dumper;
use JSON::XS;
use Encode qw(encode_utf8);

my $file = "sample.conf";

my $DEBUG = 0;

###
# Key words:
# sections
# pre
# post
# path
# service
# op

my $string;

open (FILE, $file) || die "Could not open file $file: $!\n";
foreach (<FILE>){
	$_ =~ s/\n/\\n/g;
	$string = join(" ", $string, $_);
}
close FILE;

$string =~ s/(.*)\\n$/$1/;

#print $string;

my $config_file = JSON::XS->new->utf8->allow_nonref->decode($string);

#my $conf_device = $config->{conf}->{device};
#my $conf_version = $config->{conf}->{version};
my $conf_version = 'test_sample';

#print "Config is for device $conf_device and version is $conf_version.\n" if $DEBUG;
### Check here if config is meant for myself or not
### Check if the config obtained has the version higher than my current config

## If config needs to be applied, create a tmp directory
my $CONFPATH="/tmp/conf-$conf_version";
system("rm -rf $CONFPATH");
system("mkdir $CONFPATH");

my @skiplist = qw/serial
                    template_name
                    status
                    isActive
                    customerid
                    name
                    tags
                    /;
my (%precmd, %postcmd);

my $config = $config_file->{'services'};

foreach my $block (keys %{$config}){
	print "Config Block for $block:" . "\n" if $DEBUG;

## Get "path" of the config file
## Get "pre" command to be executed
## Get "sections" for the service
#	foreach my $keywords (keys %{$config->{$block}} ){
#		print $block . ": \t" . $keywords . "-> " . $config->{$block}->{$keywords} . " \n";
#	}

	if ($block eq "files"){
		print "FILES section found: " . ref($config->{$block}) . "\n" if $DEBUG;
        my (@config, $path);
		foreach my $file (@{$config->{$block}}){
			if (ref($file) eq 'HASH'){
                print "file:\t\t" . $file->{"path"} . "\n" if $DEBUG;
                $path = $file->{"path"};
                $precmd{$path} = $file->{"preop"} if $file->{"preop"};
                $postcmd{$path} = $file->{"postop"} if $file->{"postop"};
                print "PRE CMD: " . $precmd{$path} . "\n" if $DEBUG;
                print "POST CMD: " . $postcmd{$path} . "\n" if $DEBUG;
	            write_file("$CONFPATH$path", $file->{"content"});
            }
		}
    next;
	}

	my $path = $config->{$block}->{"path"};
	my $pre_cmd = $config->{$block}->{"preop"};
	my $post_cmd = $config->{$block}->{"postop"};
	my $service = $config->{$block}->{"service"};
	my $sections = $config->{$block}->{"sections"};

	my @config;

	if ($pre_cmd){
		print "PRE CMD found: $pre_cmd\n" if $DEBUG;
		$precmd{$block} = $pre_cmd;
	}
	if ($post_cmd){
		print "POST CMD found: $post_cmd\n" if $DEBUG;
		$postcmd{$block} = $post_cmd;
	}
	if ($service){
		print "SERVICE found: $service\n" if $DEBUG;
	}
	if ($sections){
		print "SECTIONS found: ***" . ref($sections) . "\n" if $DEBUG;
		if (ref($sections) eq 'HASH'){
			foreach my $arg( keys %{$sections} ){
				print "\n******" . $arg . "\t" . $sections->{$arg} . "\n" if $DEBUG;
				if (ref($sections->{$arg}) eq 'HASH'){
					print "ARG is a HASH \n" if $DEBUG;
					my @attr = keys %{$sections->{$arg}};
					print "\nconfig " . $sections->{$arg}->{'hoptype'} . " " . $sections->{$arg}->{'hopname'} . "\n" if $DEBUG;
					push @config, "\nconfig $sections->{$arg}->{'hoptype'} $sections->{$arg}->{'hopname'}\n";
					foreach my $confattr (@attr){
						next if ($confattr =~ /hoptype/ or $confattr =~ /hopname/ or $confattr =~ /hoppos/);
						if (ref($sections->{$arg}->{$confattr}) eq 'ARRAY'){
							my @list = @{$sections->{$arg}->{$confattr}};
							foreach (@list){
								print "\tlist\t" . $confattr . " " . $_ . "\n" if $DEBUG;
								push @config, "\tlist\t $confattr $_\n";
							}
						}
						else{
							print "\toption\t" . $confattr . " " . $sections->{$arg}->{$confattr} . "\n" if $DEBUG;
							push @config, "\toption\t$confattr $sections->{$arg}->{$confattr}\n";
						}
					}
				}
				elsif (ref($sections->{$arg}) eq 'ARRAY'){
					print "ARG is an ARRAY \n" if $DEBUG;
					foreach my $arr_arg (@{$sections->{$arg}}){
						if (ref($arr_arg) eq 'HASH'){
							my @attr = keys %{$arr_arg};
							print "\nconfig " . $arr_arg->{'hoptype'} . " " . $arr_arg->{'hopname'} . "\n" if $DEBUG;
							push @config, "\nconfig $arr_arg->{'hoptype'} $arr_arg->{'hopname'}\n";

							foreach my $confattr (@attr){
								next if ($confattr =~ /hoppos/ or $confattr =~ /hoptype/ or $confattr =~ /hopname/);
								if (ref($arr_arg->{$confattr}) eq 'ARRAY'){
									my @list = @{$arr_arg->{$confattr}};
									foreach (@list){
										print "\tlist\t" . $confattr . " " . $_ . "\n" if $DEBUG;
										push @config, "\tlist\t $confattr $_\n";
									}
								}
								else{
									print "\toption\t" . $confattr . " " . $arr_arg->{$confattr} . "\n" if $DEBUG;
									push @config, "\toption\t$confattr $arr_arg->{$confattr}\n";
								}	
							}
						}
					#print "config" . " " . $arr_arg . "\n";
					}
				}
			}
		}
	write_file("$CONFPATH$path", @config);
	}
}
### End processing of foreach config BLOCK;

### Execute PreCmds
exec_pre();
exec_post();

### Copy Config to /etc/config

### Execute PostCmds

### Report Success / Failure

sub exec_pre(){
## Subroutine to exectute "pre" commands / activities
	foreach my $key (keys %precmd){
		print "Executing PRECMD $precmd{$key} for $key...\n" if $DEBUG;
		system("$precmd{$key}") == 0
			or log_info("system $precmd{$key} failed: $?");
		sleep 5;
	}
}

sub exec_post(){
## Subroutine to execute "post" commands / activities
	foreach my $key (keys %postcmd){
		print "Executing POSTCMD $postcmd{$key} for $key...\n" if $DEBUG;
		system("$postcmd{$key}") == 0
			or log_info("system $postcmd{$key} failed: $?");
		sleep 5;
	}
}

sub write_file(){
## Write file to the given path
	my ($path, @conf) = @_;
	print "Writing config to $path...\n";
## Create directories to last but one path object
	my $dir = $path;
	if ($dir =~ /^(.*)\/[^\/]+(.*)$/){
		if (-e $1){
			log_info ("$1: Directory Exists");
		}
		else {
			system("mkdir -p $1");
		}
	}
	else{
		log_info ("$dir: Invalid path name: $!\n") && die;
	}
	open(CONF,">$path") || die "Unable to open file $path: $!";
	print CONF @conf;
	close CONF;
	return;
}

sub log_info{
	my $msg = shift;
	print $msg . "\n";
	return;
}
