#!/usr/bin/env node
// Make node_modules/.bin/tailwindcss resolvable by Hugo's css.TailwindCSS.
//
// Hugo looks up the Tailwind CLI at node_modules/.bin/<name> and insists on a
// Node.js script: a symlink to a .js/.mjs/.cjs file, a file with a node
// shebang, or an npm wrapper whose entry point it can parse. pnpm writes a
// shell wrapper that exports NODE_PATH first, and Hugo's parser picks that
// first path instead of the .mjs entry point, so the build dies with
//   binary "tailwindcss" is not a Node.js script
// See https://github.com/gohugoio/hugo/issues/14852 (fix PR #14856 is still
// open as of Hugo 0.166.0). Drop this script once that ships.
//
// Runs as a postinstall hook, so pnpm, npm, CI and Netlify all get it.

import { existsSync, lstatSync, readlinkSync, rmSync, symlinkSync } from 'node:fs'
import { join } from 'node:path'

const root = process.cwd()
const entryPoint = join('@tailwindcss', 'cli', 'dist', 'index.mjs')
const target = join('..', entryPoint) // relative to node_modules/.bin
const binPath = join(root, 'node_modules', '.bin', 'tailwindcss')

// Nothing to do when the CLI is not installed (e.g. a --prod install).
if (!existsSync(join(root, 'node_modules', entryPoint))) {
  process.exit(0)
}

// npm already symlinks straight at the entry point - leave it alone.
if (existsSync(binPath) && lstatSync(binPath).isSymbolicLink()) {
  if (readlinkSync(binPath) === target) process.exit(0)
}

try {
  rmSync(binPath, { force: true })
  symlinkSync(target, binPath)
  console.log(`linked node_modules/.bin/tailwindcss -> ${target}`)
} catch (error) {
  // Never fail the install over this; the Hugo build reports it clearly enough.
  console.warn(`could not link node_modules/.bin/tailwindcss: ${error.message}`)
}
