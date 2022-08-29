<script>
    import { link } from 'svelte-navigator';
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
        try {
            const res = await fetch(`${URL}/memories/`);
		    memories = await res.json();
            isMemoriesLoading = false;
        } catch (e) {
            console.log(e)
            isMemoriesLoading = false;
        }
	});

</script>

<style>
    .link {
        text-decoration: none;
    }
</style>

<nav>
    <h1>Мои воспоминания</h1>
    {#if isMemoriesLoading}
        <div>Загрузка...</div>
    {:else}
        {#each memories as memory, i}
            <a class="link" use:link on:click={setMemoryTitle(memory.title)} href={`memories/${memory.id}`}>
                <p>{memory.title}</p>
            </a>
        {/each}
    {/if}

</nav>
