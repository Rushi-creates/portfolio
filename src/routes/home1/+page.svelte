<script>
	import CtComponent from '$lib/ctComponent.svelte';
</script>

<div class="outer">
	<div class="myflex">
		<div class="app">
			<div class="hello">Hello, I'm</div>
			<div class="title">Rushi Patil</div>
			<div class="subtitle">I'm a fullstack developer</div>

			<div class="image-row">
				<img src="flutter_icon.png" alt="Image 1" />
				<img src="dart_icon.png" alt="Image 2" />
				<img src="svelte_icon.png" alt="Image 3" />
				<img src="next_icon.png" alt="Image 4" />
				<img src="python_icon.png" alt="Image 5" />
				<img src="react_icon.png" alt="Image 6" />
			</div>
		</div>
		<div class="circleFlex">
			<div class="circle">
				<img src="profilePic.png" alt="Image" />
			</div>
		</div>
	</div>
	<div class="spaced" />
	<CtComponent />
</div>

<style>
	.spaced {
		height: 25vh;
	}

	.circleFlex {
		position: relative;
		right: -15%;
	}

	.circle {
		position: relative;
		width: 300px;
		height: 300px;
		border-radius: 50%;
		/* background: linear-gradient(to bottom right, transparent, transparent); */
		overflow: hidden;
	}

	.circle img {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		max-width: 100%;
		max-height: 100%;
	}

	.myflex {
		/* background-color: #58FF82; */
		display: flex;
		flex-direction: row;
		align-items: end;
		justify-content: space-between;
		height: 100%;
	}

	.image-row {
		display: flex;
		align-items: center;
		padding-top: 20px;
	}

	.image-row img {
		width: 25px;
		height: 25px;
		object-fit: contain;
		margin-right: 10px;
	}

	.outer {
		background: linear-gradient(to bottom, transparent, #bf80ff);
		width: 75vw;
		height: 65vh;
	}
	.app {
		position: relative;
		left: 120px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		height: 100%;
	}

	.title {
		font-family: 'Arial', sans-serif;
		font-size: 80px;
		font-weight: bold;
		color: #190061;
	}
	.hello {
		padding: 0px;
		font-family: 'Arial', sans-serif;
		font-size: 15px;
		color: #756e82;
	}
	.subtitle {
		padding: 0px;
		font-weight: bold;
		font-family: 'Arial', sans-serif;
		font-size: 20px;
		color: #433a51;
	}
</style>
