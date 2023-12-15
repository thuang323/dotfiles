touch build.gradle
mkdir libs
cat > build.gradle << EOF
plugins {
    id 'java'
    id 'application'
}

jar {
    manifest {
        attributes 'Main-Class': 'Main'
    }
}

application {
    mainClassName = 'Main'
}

repositories {
    mavenCentral()
}

dependencies {
    implementation fileTree(dir: 'libs', include: ['*.jar'])
}
EOF

# dependencies are used for adding any third party libraries
# stores all the third party libraries in libs directory

mkdir src
mkdir src/main
mkdir src/main/java
touch src/main/java/Main.java

cat > src/main/java/Main.java << EOF
public class Main {
  public static void main(String[] args) {
    
	}
}
EOF

gradle wrapper

touch .gitignore
cat > .gitignore << EOF
.DS_Store
.settings/
gradle/
gradlew
gradlew.bat
.gradle
**/build/
.project
.classpath
EOF
