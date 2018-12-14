This is a readme file that has some info on how the code is organized and 
some best practices (based on terraform blogs & other books).

Please try to follow them since it becomes hard to destroy resources and make changes 
once the infra is up & many people depend on it. 

Initial code review & design is important in IAC (Infrastructure As Code).
Once infra is setup might be some resistance to taking it down for changes.

Directory Structure:
Just like other programming language projects, it is critical to get file/dir
layout in a proper way. This is a bit more relevant in terraform since the modules can be 
designed based on file/dir layout. 

Some overall suggestions:

1. Do not use "hyphens" when naming resources or variables. Use "underscore"
2. Do not use arrays, loops, maps, lists etc over multiple resources. Unlike
other high level languages, terraform is a declarative language for infra.
Try to use the WYSIWIG (What u see is what u get) model as opposed to 
DRY (Don;t repeat yourself). Concrete example: When you see a AWS COnsole UI, just 
map that to a terraform resource. Don;t try to introduce loops to abstract multiple
resources. In general don't perform any operation which operates over an array/list/map of 
resources.
3. Do not change/add/delete more than say 5 or 10 resources in one PR review. ie In other words do 
the infra changes gradually by testing small changes and then committing them into repo gradually.
4. Do not submit PR until terraform init, plan and apply is done 
5. Immediately respond to PRs before doing another terraform init, plan, apply.
ie Please make sure that incremental changes are understood, reviewed before making 
more changes.
6. Use tags generously to keep track of things.
7. In general, avoid writing complex code just to use language features. Always
choose readability & understanding as opposed to using complex features of language.
8. Use terraform Modules when possible but do not use nested modules.
9. Never mix inline definitions with broken out definitions (ie do not use inline ingress & egress
rules in securitygroup object, instead split the rules in its own objects and 
define them and then reference the securitygroup object, same for route tables & route table
associations & other such objects). Under any case, do not mix these styles in the same resource 
definition. Terraform will totally get confused.
10. Do not cut and paste code until u get good practice in coding
(even though it is very tempting in terraform to do so)
11. If you do cut & paste, verify code a lot since there are many interpolation syntax that 
will change between resources.
12. Use VSCode or some other editor which has terraform plugin. i
VSCode terraform Plugin has some small issues, but overall I found it very useful.
13. Always use the Hashicorp resource definition page when u r coding a resource.
I found it to be good reference.
14. Try to do a terraform destroy once every while (in a scratchpad env (say by using 
tag_name as "CTP_SCRATCH" for example) to verify
that the entire infra can be deleted with one command. And build it back up with terraform apply
to verify things are back up. Our infra seems small enough to be able to do this once every 
few weeks.





TCTP-Infra : Top level directory

main.tf : This is the top level terraform code which sources all the modules in the 
system. I have organized these as Terraform modules by separating them into logical groupings.

Also please pay attention to how files are named AND how resources are named.
It is critical to follow a consistent format. I have followed a naming 
recommendation from Hashicorp itself.
Resource Names: They are named with the provider prefix removed and in its place the 
name of the resource specified. For example, "aws_vpc" resource will be named "ctp_vpc".

File names: They are named as "resourcetype-resourcename" eg "alb-nameofalb"



The logical groupings are mapped as shown below:
 
apps : Has definition for all apps specific resources

apps/alb: This has all ALB specific resource

apps/microservices: This has the specific microservices info

apps/sg-albs : This has the security groups definitions for the ALBs

apps/sg-apps: This has the security groups definitions for applications

resources: This has definition for many non-application resources

resources/shared: This has definitions for shared resources (eg lambda, sns etc)

resources/global: This has definitions for global resources (eg S3 etc)


vpc: This has all VPC and networking related definitions. Individual
files should give an idea as to what they do & what definitions they contain.

