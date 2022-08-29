<script>
	import { Router, Route, Link } from "svelte-navigator";
	import Memories from "./routes/memories/Memories.svelte";
	import Memory from "./routes/memories/Memory.svelte";

</script> 

<style>
	@import url('https://fonts.googleapis.com/css2?family=Roboto+Flex:opsz@8..144&display=swap');
	* {
		font-family: 'Roboto Flex', sans-serif;
	}
</style>

<div>
	<Router >
		<Route primary={false} path="/" component={Memories} />
		<Route path="/memories/*">
			<Route path=":id" component={Memory} />
		</Route>
	</Router>
</div>
