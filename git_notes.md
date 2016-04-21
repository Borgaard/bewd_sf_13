BACK-END WEB DEVELOPMENT
============================

![GeneralAssemb.ly](https://github.com/generalassembly/ga-ruby-on-rails-for-devs/raw/master/images/ga.png "GeneralAssemb.ly")


## Fork Our Repo From Github

- The instructor will demonstrate where the `fork` button is on github 

- Our cohort's git repo lives here -> [ga-students/bewd_sf_10](https://github.com/ga-students/bewd_sf_10)


- Clone the `forked` version of our repo
	- `git clone https://github.com/[your_git_name]/bewd_sf_10.git`
	

- Add the remote parent repo 
	- `git remote add upstream https://github.com/ga-students/bewd_sf_10.git`

- Confirm that your forked remote version & the `upstream` remote version are connected to your local repo
	-  `git remote --verbose `


### Pull the latest version of `upstream` (the parent repo)
	- `git pull upstream master `



##TROUBLE SHOOTING 


###Get out of Git Jail

 -  `git stash`
 -  `git remote update`
 -  `git reset --hard upstream/master`
 -  `git push origin +master`

###NOTES

- You should not be experiencing `diff` conflicts with the parent repo when you're on your master branch, but if you are, the steps above will free you from `git` jail.


###Resources

Master Github by CodeSchool
- [Master Github](https://www.codeschool.com/courses/mastering-github?gclid=CLKvndDQzMUCFU6VfgodrbYA5w)


Becoming a Git Guru by atlassian (Advanced)
- [Git Guru](https://www.atlassian.com/git/tutorials/)
