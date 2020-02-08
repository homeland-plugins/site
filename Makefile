.PHONY : test

test:
	rails db:drop db:create
	rails test
