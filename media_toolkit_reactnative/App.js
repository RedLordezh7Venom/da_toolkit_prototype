import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

import HomeScreen from './screens/HomeScreen';
import PdfEditorScreen from './screens/PdfEditorScreen';
import ImageEditorScreen from './screens/ImageEditorScreen';
import VideoEditorScreen from './screens/VideoEditorScreen';

const Stack = createNativeStackNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Home">
        <Stack.Screen 
          name="Home" 
          component={HomeScreen}
          options={{ headerShown: false }}
        />
        <Stack.Screen name="PdfEditor" component={PdfEditorScreen} />
        <Stack.Screen name="ImageEditor" component={ImageEditorScreen} />
        <Stack.Screen name="VideoEditor" component={VideoEditorScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App; 