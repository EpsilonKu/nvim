mkdir -p ~/.local/bin
wget -c "http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz" -O ~/.local/bin/lsp.tar.gz && tar -xf ~/.local/bin/lsp.tar.gz && rm ~/.local/bin/lsp.tar.gz 
wget -c "https://projectlombok.org/downloads/lombok.jar" -O ~/.local/bin/lombok.jar
touch ~/.local/bin/jdtls.sh
cat << EOF > ~/.local/bin/jdtls.sh
#!/usr/bin/env bash
JAR="$HOME/.local/bin/plugins/org.eclipse.equinox.launcher_*.jar"
GRADLE_HOME=$HOME/gradle /usr/lib/jvm/java-11-openjdk/bin/java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -javaagent:$HOME/.local/bin/lombok.jar \
  -Xbootclasspath/a:$HOME/.local/bin/lombok.jar \
  -jar $(echo "$JAR") \
  -configuration "$HOME/.local/bin/config_linux" \
  -data "${1:-$HOME/workspace}" \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED

EOF
chmod +x $HOME/.local/bin/jdtls.sh
