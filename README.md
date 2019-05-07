# Expo Anywhere

Add Expo and Typescript to any react-native, create-react-native-app (crna), or react-native-web existing app. 😱

All you have to do is clone this repo directly into your `react-native` or `create-react-native-app` project and then run the `setupExpo.sh` script.


## Instructions

1. run this directly in your react native root project folder
```bash
git clone https://github.com/chrisbull/expo-ts-anywhere
```

2. while still in your root react native project run
```
./expo-ts-anywhere/setupExpo.sh
```

3. **IMPORTANT** 
Create an index.js file at the root level (or adjust yours if you have one) to only import the defualt App from your src/App file. 
Example:

```index.js
import App from './src/App'
export defualt App
```

4. Now you can run expo from the start script just like you once did with react-native-scripts
```
yarn start
```

5. Remove any unnecessarily babel or metro compiler options such as .babelrc or babel.config.json (if these cause problems)

## How it works
1. Installs Typescript and other typescript devDependencies
2. Installs expo and react-native@expo and react@16.5 (beware this might downgrade your current version)
3. Replaces the default react-native app.json with one that works with Expo
4. Copies image assets for icon.png and loading-screen.png
5. Creates a filed called ExpoEntry.js to be used for entrace while running 
6. Replaces npm scripts like `react-native-scripts start` with `expo start --ios` etc


## Caveats
This project doesn't fix issues with react versions and expo (ie Expo requires react@16.5 and react-native@expo.version)

Oh and you may need to go through your app and replace imports that are now native to Expo and no longer supported through `react-native link`. For example:

Replace `import LinearGradient from 'react-native-linear-gradient'`
with `import { LinearGradient } from 'expo'`


Other common knows ... 
- `import {... } from 'react-native-vector-icons'`  to `import { ... } from '@expo/vector-icons'`
- `import {Svg, G, Def} from 'react-native-svg'` to 
    ```
    import { Svg } from 'expo'
    const { G, Def } = Svg
    ```
    
 - ... you get the idea
