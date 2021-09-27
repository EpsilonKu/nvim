mkdir -p $HOME/.local/bin
wget -c "http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz" -O $HOME/.local/bin/lsp.tar.gz && tar -xf $HOME/.local/bin/lsp.tar.gz -C $HOME/.local/bin/ && rm $HOME/.local/bin/lsp.tar.gz 
wget -c "https://projectlombok.org/downloads/lombok.jar" -O $HOME/.local/bin/lombok.jar
git clone https://github.com/dgileadi/vscode-java-decompiler.git $HOME/.local/bin/vscode-java-decompiler/

