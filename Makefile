# Load veriables from .env
include .env
export $(shell sed 's/=.*//' .env)

# Binaries
BIN_FORGE=$(HOME)/.foundry/bin/forge

# Localhost contract addresses
LOCALHOST_SIMPLE_STORAGE := 0x5FbDB2315678afecb367f032d93F642f64180aa3

# Sepolia contract addresses
SEPOLIA_SIMPLE_STORAGE := 0x7E90d9E49E96F1bF2706B391b649238ED7ba4086

# Amoy contract addresses
AMOY_SIMPLE_STORAGE := 0x63878A24fe87701E69d200D2b0FC5347da672494

# Ethereum contract addresses
ETHEREUM_SIMPLE_STORAGE :=

# Polygon contract addresses
Polygon_SIMPLE_STORAGE :=

localhost: deploy-simplestorage-localhost

# Deploy the SimpleStorage contract
deploy-simplestorage-localhost:
	$(BIN_FORGE) script script/DeploySimpleStorage.s.sol --rpc-url $(LOCALHOST_RPC_URL) --broadcast --private-key $(LOCALHOST_DEPLOYER_PRIVATE_KEY)
deploy-simplestorage-amoy:
	$(BIN_FORGE) script script/DeploySimpleStorage.s.sol --rpc-url $(AMOY_RPC_URL) --broadcast --private-key $(DEPLOYER_PRIVATE_KEY)
deploy-simplestorage-sepolia:
	$(BIN_FORGE) script script/DeploySimpleStorage.s.sol --rpc-url $(SEPOLIA_RPC_URL) --broadcast --private-key $(DEPLOYER_PRIVATE_KEY)
deploy-simplestorage-polygon:
	$(BIN_FORGE) script script/DeploySimpleStorage.s.sol --rpc-url $(POLYGON_RPC_URL) --broadcast --private-key $(DEPLOYER_PRIVATE_KEY)
deploy-simplestorage-ethereum:
	$(BIN_FORGE) script script/DeploySimpleStorage.s.sol --rpc-url $(ETHEREUM_RPC_URL) --broadcast --private-key $(DEPLOYER_PRIVATE_KEY)