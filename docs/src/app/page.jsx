// src/app/page.jsx
import { redirect } from 'next/navigation';

export default function Home() {
  redirect('/docs'); // change path to your first doc
}
