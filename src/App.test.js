import { render, screen } from '@testing-library/react';
import React from 'react';
import App from './App';

test('renders the page', () => {
  render(<App />);
  const appComponent = screen.getByTestId('app');
  expect(appComponent).toBeInTheDocument();
});
