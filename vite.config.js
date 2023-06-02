import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';
import { viteStaticCopy } from 'vite-plugin-static-copy';


export default defineConfig({
	plugins: [
		viteStaticCopy({
			targets: [
				{
					src: 'fp2/build/web/***', dest: 'flutter'

				}
			]
		}),

		sveltekit()]
});
