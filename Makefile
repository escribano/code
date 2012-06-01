REPORTER = dot

debugall:
	@DEBUG=* coffee server -a

debugcluster:
	@DEBUG=code:* coffee server -d

debug:
	@DEBUG=code:* coffee server -a

server:
	@DEBUG=app:index coffee server -a

test:
	@NODE_ENV=test ./node_modules/.bin/mocha \
		--reporter $(REPORTER)

test-acceptance:
	@NODE_ENV=test ./node_modules/.bin/mocha \
		--reporter spec \
		test/acceptance/*.js

test-cov: lib-cov
	@CODE_COV=1 $(MAKE) test REPORTER=html-cov > coverage.html

lib-cov:
	@jscoverage lib lib-cov

.PHONY: site test test-acceptance