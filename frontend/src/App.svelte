<script>
	import { Router, Route, Link } from "svelte-navigator";
	import Memories from "./routes/memories/Memories.svelte";
	import Memory from "./routes/memories/Memory.svelte";

</script> 

<div>
	<Router >
		<Route primary={false} path="/" component={Memories} />
		<Route path="/memories/*">
			<Route path=":id" component={Memory} />
		</Route>
	</Router>
</div>
