<script>
	import { onMount } from 'svelte';

	let target;

	onMount(() => {
		if (window._flutter) {
			window._flutter.loader.loadEntrypoint({
				entrypointUrl: '/flutter/main.dart.js',
				onEntrypointLoaded: async (engineInitializer) => {
					let appRunner = await engineInitializer.initializeEngine({
						hostElement: target,
						assetBase: '/flutter/'
					});
					await appRunner.runApp();
				}
			});
		}
	});
</script>


<svelte:head>
	<script src="/flutter/flutter.js"></script>
</svelte:head>

<div class="flutter-target" bind:this={target} />



<style>
	.flutter-target {
		object-fit: contain;
		/* width: 350px;
		height: 650px; */
		/* height: 76.5vh;
		width: 23.5vw; */
		width: 15vw;
  height: 50vh;
		background-color: #f2f2f2;
		border: 1px solid grey;
	}
</style>
