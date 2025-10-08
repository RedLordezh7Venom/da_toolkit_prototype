import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet, SafeAreaView } from 'react-native';
import { useNavigation } from '@react-navigation/native';

const HomeScreen = () => {
  const navigation = useNavigation();

  const options = [
    { title: 'PDF Editor', route: 'PdfEditor', color: '#FF6B6B' },
    { title: 'Image Editor', route: 'ImageEditor', color: '#4ECDC4' },
    { title: 'Video Editor', route: 'VideoEditor', color: '#45B7D1' },
  ];

  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.header}>Media Editor</Text>
      <View style={styles.optionsContainer}>
        {options.map((option, index) => (
          <TouchableOpacity
            key={index}
            style={[styles.optionButton, { backgroundColor: option.color }]}
            onPress={() => navigation.navigate(option.route)}
          >
            <Text style={styles.optionText}>{option.title}</Text>
          </TouchableOpacity>
        ))}
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  header: {
    fontSize: 28,
    fontWeight: 'bold',
    textAlign: 'center',
    marginTop: 40,
    marginBottom: 40,
  },
  optionsContainer: {
    flex: 1,
    padding: 20,
    justifyContent: 'center',
    gap: 20,
  },
  optionButton: {
    padding: 20,
    borderRadius: 10,
    alignItems: 'center',
    elevation: 3,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
  },
  optionText: {
    color: '#fff',
    fontSize: 20,
    fontWeight: 'bold',
  },
});

export default HomeScreen; 