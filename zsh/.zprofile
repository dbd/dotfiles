export PATH=$PATH:/Users/derekdaniels/Library/Android/sdk/tools:/Users/dbd/bin:/Users/dbd/go/bin:/usr/local/bin
export GOPATH="$HOME/go"

if [[ "$os" == "Darwin" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
