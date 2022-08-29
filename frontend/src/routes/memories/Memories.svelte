<script>
    import { Link } from 'svelte-navigator';
    import { onMount } from 'svelte'; 
    import { URL } from '../../constants';
    import {selectedMemoryTitle} from '../../stores';

    export let navigate;
    export let location;

	let memories = [];
    let isMemoriesLoading = true;

    const setMemoryTitle = (title) => {
        selectedMemoryTitle.set(title);
    }

	onMount(async () => {
		const res = await fetch(`${URL}/memories/`);
		memories = await res.json();
        isMemoriesLoading = false;
	});

</script>

<style>
    
</style>

<nav>
    <h1>Мои воспоминания</h1>
    {#if isMemoriesLoading}
        <div>Загрузка...</div>
    {:else}
        {#each memories as memory, i}
            <Link on:click={setMemoryTitle(memory.title)} to={`memories/${memory.id}`}>
                <p>asdfsfsdfs</p>
            </Link>
        {/each}
    {/if}

</nav>
