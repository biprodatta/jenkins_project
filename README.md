# jenkins_project

here in this project, I have installed jenkins in my local and inatalled all required plugins like git, docker, tterraform etc. then create a jenkins pipeline and in first stage of the pipeline, I have pulled a standard centos 7 docker image and the I have installed Tomcat and its associated dependecies. then I have created an custom image with all changes. the Pushed the custom image to my docker repo. then in another stage of the same pipeline I have tun terrafoem apply and using terraform I an creating and amazon linux EC2 server and while creating the ec2 server in User Data section I am downloading the custom docker image from my docker repo and running that image in the server on port 8080.

# TF code base
## Introduction
This is sample readme for terraform module
<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->
## Footer
Contributor Names
