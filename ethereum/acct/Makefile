
all: \
	./contracts/AcctToken_sol_AcctToken.abi 

truffle_test:
	truffle test --network development

test3_migrate:
	./unlock-6ff-3.sh
	truffle migrate --reset --network test3 | tee m.out
	upd-gcall <m.out
	save-old.sh

lint:
	solium --file contracts/SignedData.sol
	solium --file contracts/SignedDataVersion01.sol


./contracts/AcctToken_sol_AcctToken.abi: ./contracts/AcctToken.sol
	( cd contracts ; solc openzeppelin-solidity/=../openzeppelin-solidity/ --allow-paths . --overwrite --abi -o . AcctToken.sol ; mv AcctToken.abi AcctToken_sol_AcctToken.abi )
	( cd contracts ; /Users/corwin/bin/check-json-syntax -p <AcctToken_sol_AcctToken.abi >,tmp ; mv ,tmp AcctToken_sol_AcctToken.abi )
	( cd contracts ; solc openzeppelin-solidity/=../openzeppelin-solidity/ --allow-paths . --overwrite --bin -o . AcctToken.sol ; mv AcctToken.bin AcctToken_sol_AcctToken.bin )
	( cd contracts ; solc openzeppelin-solidity/=../openzeppelin-solidity/ --allow-paths . --overwrite --bin-runtime -o . AcctToken.sol )
	( cd contracts ; abigen --abi AcctToken_sol_AcctToken.abi --pkg AcctToken --out AcctToken.go )
	mkdir -p ./lib/AcctToken
	cp ./contracts/AcctToken.go ./lib/AcctToken
	cp ./contracts/AcctToken_sol_AcctToken.abi ./abi
	( cd ./lib/AcctToken ; go build )





migrate:
	truffle migrate --reset	

philip_migrate:
	date
	/Users/corwin/Projects/eth158/unlock-c2a.sh
	truffle migrate --reset --network local

upd_addr:
	upd-gcall <m.out
	save-old.sh

philip_test:
	date
	/Users/corwin/Projects/eth158/unlock-c2a.sh
	truffle test --network local

philip_unlock:
	/Users/corwin/Projects/eth158/unlock-c2a.sh

t_dev:
	truffle develop log

test:
	truffle test
.PHONY: test

test_local:
	truffle test --network local
.PHONY: test_local

