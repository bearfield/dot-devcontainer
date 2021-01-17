.PHONY: create-branch
create-branch:
	git branch $(TARGET_BRANCH)

.PHONY: push
push:
	git checkout $(TARGET_BRANCH)
	git merge $(CURRENT_BRANCH) 
	git push origin $(TARGET_BRANCH)
	git checkout $(CURRENT_BRANCH)