/* eslint-env node */
import { Footer, Layout, Navbar } from 'nextra-theme-docs'
import { Banner, Head } from 'nextra/components'
import { getPageMap } from 'nextra/page-map'
import 'nextra-theme-docs/style.css'
import { Open_Sans } from 'next/font/google'

const geist = Open_Sans({
  subsets: ['latin'],
})


export const metadata = {
  metadataBase: new URL('https://mind-paystack-docs.vercel.app'),
  title: {
    template: '%s - MindPaystack'
  },
  description: 'MindPaystack: The Dart-First Paystack SDK',
  applicationName: 'MindPaystack',
  generator: 'Next.js',
  appleWebApp: {
    title: 'MindPaystack'
  },
  other: {
    'msapplication-TileImage': '/ms-icon-144x144.png',
    'msapplication-TileColor': '#fff'
  },
  twitter: {
    site: 'https://mind-paystack-docs.vercel.app'
  }
}

export default async function RootLayout({ children }) {
  const navbar = (
    <Navbar
      logo={
        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
          <img src="/logo.svg" alt="MindPaystack" style={{ width: '24px', height: '24px' }} />
          <b>MindPaystack</b>
        </div>
      }
      chatLink="https://discord.gg/dartmind"
    />
  )
  const pageMap = await getPageMap()
  return (
    <html lang="en" className={geist.className} dir="ltr" suppressHydrationWarning>
      <Head>
        <link rel="icon" href="/logo.svg" type="image/svg+xml" />
        <link rel="alternate icon" href="/favicon.ico" />
      </Head>
      <body>
        <Layout
          // banner={<Banner storageKey="Nextra 2">Nextra 2 Alpha</Banner>}
          navbar={navbar}
          footer={<Footer>MIT {new Date().getFullYear()} © MindPaystack by Dartmind.</Footer>}
          editLink="Edit this page on GitHub"
          docsRepositoryBase="https://github.com/Dartmind-OpenSource/mind-paystack/blob/main/docs/src/content"
          sidebar={{ defaultMenuCollapseLevel: 1 }}
          pageMap={pageMap}
        >
          {children}
        </Layout>
      </body>
    </html>
  )
}
