mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/bin/jdtls

wget -c "http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz" -O $HOME/.local/bin/jdtls/lsp.tar.gz && tar -xf $HOME/.local/bin/jdtls/lsp.tar.gz -C $HOME/.local/bin/jdtls && rm $HOME/.local/bin/jdtls/lsp.tar.gz 

wget -c "https://projectlombok.org/downloads/lombok.jar" -O $HOME/.local/bin/lombok.jar

git clone https://github.com/dgileadi/vscode-java-decompiler.git $HOME/.local/bin/vscode-java-decompiler/

git clone https://github.com/microsoft/java-debug.git $HOME/.local/bin/java-debug/
cd $HOME/.local/bin/java-debug/
./mvnw clean install
