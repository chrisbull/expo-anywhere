# remove existing root project app.json (this shouldn't contian much, so no big deal)
rm ./app.json;
rm ./tsconfig.json;

# mv all required assets for expo to root project
cp -r ./expo-anywhere/expo-assets/** . ;

# install npm dependencies
yarn add expo \
    @expo/vector-icons \
    react@16.5.0 \
    react-native@https://github.com/expo/react-native/archive/sdk-32.0.0.tar.gz \
    react-navigation;

# install npm dev dependencies
yarn add -D typescript \
  @types/expo \
  @types/expo__vector-icons \
  @types/prettier \
  @types/react \
  @types/react-native \
  @types/react-navigation \
  @types/react-test-renderer \
  babel-preset-expo \
  jest-expo \
  jest-styled-components \
  prettier \
  prettier-tslint \
  react-test-renderer \
  ts-jest \
  tslint \
  tslint-config-airbnb \
  tslint-config-prettier \
  tslint-language-service \
  tslint-plugin-prettier \
  tslint-react \
  tslint-react-native \
  typescript \
  typescript-styled-plugin \
  typescript-tslint-plugin \
  typesync;

# create typescript file
tsc \
  --init \
  --noImplicitReturns \
  --pretty \
  --types jest \
  --target es6 \
  --module esnext \
  --lib dom,es6,es7,esnext.asynciterable \
  --moduleResolution node \
  --jsx react-native \
  --allowJs \
  --checkJs \
  --sourceMap \
  --noEmit \
  --skipLibCheck \
  --isolatedModules \
  --experimentalDecorators \
  --emitDecoratorMetadata \
  --allowSyntheticDefaultImports \
  --suppressImplicitAnyIndexErrors \
  --downlevelIteration \
  --resolveJsonModule \
  --noImplicitAny \
  --noUnusedLocals \
  --noUnusedParameters \
  --preserveConstEnums \
  --removeComments \
  --baseUrl ./src \
  --alwaysStrict;

# update pacakge.json
npx json -I -f package.json -e 'this.main="./ExpoEntry.js"';
npx json -I -f package.json -e 'this.scripts = { "android": "expo start --android",
    "eject": "expo eject",
    "format": "prettier-tslint fix \"./src/**/*.{ts,js,tsx,jsx}\"",
    "ios": "expo start --ios",
    "lint": "tslint -p tsconfig.json -c tslint.json",
    "lint:fix": "tslint --fix -p tsconfig.json -c tslint.json",
    "test-tsc": "npm-run-all \"lint\" \"tsc-test\" \"ts-jest\"",
    "tsc-test": "tsc --project . --noEmit",
    "tests": "test-tsc",
    "pretty": "prettier \"./src/**/*.{ts,js,tsx,jsx}\" --write",
    "start": "expo start",
    "ts": "tsc",
    "ts-watch": "tsc -w",
    "ts-lint": "tslint -c tslint.json \"src/**/*.{ts,tsx}\"",
    "ts-lint-watch": "yarn ts-lint; chokidar \"src/**/*.{ts,tsx}\" -c \"yarn ts-lint\"",
    "test": "jest",
    "test-watch": "jest --watch",
    "typesync":"typesync",
    "postinstall": "typesync"
    }';