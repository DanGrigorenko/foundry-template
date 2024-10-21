# Load veriables from .env
include .env
export $(shell sed 's/=.*//' .env)

# Binaries
BIN_FORGE=$(HOME)/.foundry/bin/forge

# Localhost contract addresses
LOCALHOST_SIMPLE_STORAGE := 0x5FbDB2315678afecb367f032d93F642f64180aa3

# Sepolia contract addresses
SEPOLIA_SIMPLE_STORAGE := 0xAd4FC78C83Ac9414bb3D68F97eec3de1Cc36bb0e

# Amoy contract addresses
AMOY_SIMPLE_STORAGE := 0xF9b962ACcF24529d90aB96AB86363beB288AF991

# Ethereum contract addresses
ETHEREUM_SIMPLE_STORAGE :=

# Polygon contract addresses
Polygon_SIMPLE_STORAGE :=

# Contract paths
CONTRACT_PATH_SIMPLE_STORAGE := src/SimpleStorage.sol:SimpleStorage

localhost: deploy-simplestorage-localhost

# Deploy the SimpleStorage contract
deploy-simplestorage-localhost:
	$(BIN_FORGE) script script/DeploySimpleStorage.s.sol --rpc-url $(LOCALHOST_RPC_URL) --broadcast --private-key $(LOCALHOST_DEPLOYER_PRIVATE_KEY)
deploy-simplestorage-sepolia:
	$(BIN_FORGE) script script/DeploySimpleStorage.s.sol --rpc-url $(SEPOLIA_RPC_URL) --broadcast --private-key $(DEPLOYER_PRIVATE_KEY)
deploy-simplestorage-amoy:
	$(BIN_FORGE) script script/DeploySimpleStorage.s.sol --rpc-url $(AMOY_RPC_URL) --broadcast --private-key $(DEPLOYER_PRIVATE_KEY)
deploy-simplestorage-ethereum:
	$(BIN_FORGE) script script/DeploySimpleStorage.s.sol --rpc-url $(ETHEREUM_RPC_URL) --broadcast --private-key $(DEPLOYER_PRIVATE_KEY)
deploy-simplestorage-polygon:
	$(BIN_FORGE) script script/DeploySimpleStorage.s.sol --rpc-url $(POLYGON_RPC_URL) --broadcast --private-key $(DEPLOYER_PRIVATE_KEY)

# Verify the SimpleStorage contract
verify-simplestorage-sepolia:
	$(BIN_FORGE) verify-contract --chain-id 11155111 --etherscan-api-key $(ETHERSCAN_API_KEY) $(SEPOLIA_SIMPLE_STORAGE) $(CONTRACT_PATH_SIMPLE_STORAGE)
verify-simplestorage-amoy:
	$(BIN_FORGE) verify-contract --chain-id 80002 --etherscan-api-key $(POLYGONSCAN_API_KEY) $(AMOY_SIMPLE_STORAGE) $(CONTRACT_PATH_SIMPLE_STORAGE)
verify-simplestorage-ethereum:
	$(BIN_FORGE) verify-contract --chain-id 1 --etherscan-api-key $(ETHERSCAN_API_KEY) $(ETHEREUM_SIMPLE_STORAGE) $(CONTRACT_PATH_SIMPLE_STORAGE)
verify-simplestorage-polygon:
	$(BIN_FORGE) verify-contract --chain-id 137 --etherscan-api-key $(POLYGONSCAN_API_KEY) $(Polygon_SIMPLE_STORAGE) $(CONTRACT_PATH_SIMPLE_STORAGE)
