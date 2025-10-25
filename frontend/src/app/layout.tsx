import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Shodh Code Platform",
  description: "Real-time coding contest platform",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
