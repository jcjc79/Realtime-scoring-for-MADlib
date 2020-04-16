#!/usr/bin/env python

#-----------------------------------------------------------------------------------------------
#   Copyright 2019 Pivotal Software
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#----------------------------------------------------------------------------------------------

# Author: Sridhar Paladugu 
# Email: spaladugu@pivotal.io

# Description: Build Base docker images for RTS4MADlib

import os
import sys
import argparse
import shlex
import subprocess

"""
    Name: buildbaaseimages
    Description: Build JDK11 and Postgres with plpython docker images
    usage: 
    ./buildbaseimages.sh --registry pivotaldata --tag 1.3
    OR
    ./buildbaseimages.sh --tag 1.3
"""
def buildJava11(registry, tag):
	print ("Building UBUNTU image  with JDK11.........")
	buildImgCommad='docker build -t  rts4madlib-jdk:' + tag + ' ' + os.getcwd()+'/java'
	subprocess.call(shlex.split(buildImgCommad))
	if registry is None:
		print ("No Docker registry is specified. Skipping the push operation!")
	else:
		print ("pushing the image to docker registry " + registry + " with tag: " + tag)
		tagCommand='docker tag rts4madlib-jdk:' + tag + ' '+ registry + '/rts4madlib-jdk:' + tag
		subprocess.call(shlex.split(tagCommand))
		pushCommand='docker push '+ registry + '/rts4madlib-jdk:' + tag
		subprocess.call(shlex.split(pushCommand))
		cleanCommand='docker rmi -f rts4madlib-jdk:' + tag + ' ' + registry+'/rts4madlib-jdk:' + tag
		subprocess.call(shlex.split(cleanCommand))

def buildMadlibbase(registry, tag):
	print ("Building UBUNTU image with Postgres with MADlib and JDK11.........")
	buildImgCommad='docker build -t rts4madlib-pgjava:' + tag + ' ' + os.getcwd()+'/MADlib'
	subprocess.call(shlex.split(buildImgCommad))
	if registry is None:
		print ("No Docker registry is specified. Skipping the push operation!")
	else:
		print ("pushing the image to docker registry " + registry + " with tag: " + tag)
		tagCommand='docker tag rts4madlib-pgjava:' + tag + ' ' + registry+'/rts4madlib-pgjava:' + tag
		subprocess.call(shlex.split(tagCommand))
		pushCommand='docker push '+ registry +'/rts4madlib-pgjava:' + tag
		subprocess.call(shlex.split(pushCommand))
		cleanCommand='docker rmi -f rts4madlib-pgjava:' + tag + ' ' +  registry+'/rts4madlib-pgjava:' + tag
		subprocess.call(shlex.split(cleanCommand))
		
def buildPymlbase(registry, tag):
	print ("Building UBUNTU image with Postgres with plPython and JDK11.........")
	buildImgCommad='docker build -t rts4madlib-plpy:' + tag + ' ' + os.getcwd()+'/PLPython'
	subprocess.call(shlex.split(buildImgCommad))
	if registry is None:
		print ("No Docker registry is specified. Skipping the push operation!")
	else:
		print ("pushing the image to docker registry " + registry + " with tag: " + tag)
		tagCommand='docker tag rts4madlib-plpy:' + tag + ' ' + registry+'/rts4madlib-plpy:' + tag
		subprocess.call(shlex.split(tagCommand))
		pushCommand='docker push '+ registry +'/rts4madlib-plpy:' + tag
		subprocess.call(shlex.split(pushCommand))
		cleanCommand='docker rmi -f rts4madlib-plpy:' + tag + ' ' +  registry+'/rts4madlib-plpy:' + tag
		subprocess.call(shlex.split(cleanCommand))

def main():
	parser = argparse.ArgumentParser()
	parser.add_argument("--registry", nargs="?", help="docker registry for pushing images")
	parser.add_argument("--tag", nargs="?", help="docker image version")
	arguments = parser.parse_args()
	buildJava11(arguments.registry, arguments.tag)'
	buildMadlibbase(arguments.registry, arguments.tag)'
	buildPymlbase(arguments.registry, arguments.tag)
	print ("Finished building base docker images!")

if __name__ == "__main__":
	main()
