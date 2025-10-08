import React from 'react';
import { View, Text, StyleSheet, SafeAreaView } from 'react-native';

const ImageEditorScreen = () => {
  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.header}>Image Editor</Text>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  header: {
    fontSize: 24,
    fontWeight: 'bold',
    textAlign: 'center',
    marginTop: 20,
  },
});

export default ImageEditorScreen; 