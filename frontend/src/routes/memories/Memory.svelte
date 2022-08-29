<script>
    import { Link, useParams } from 'svelte-navigator';
    import { URL } from '../../constants';
    import {selectedMemoryTitle} from '../../stores';

    const params = useParams();

    let imgUrl = null;
    let selectedTitle = '';
    const image = new Image();
    
    selectedMemoryTitle.subscribe((value) => {
        selectedTitle = value;
    });

    image.src = `${URL}/images/${$params.id}`;

    image.onload = function() {
        imgUrl = this.src;
    }

</script>

<style>
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
    }
</style>


<Link to="/">
    <button>
        Назад
    </button>
</Link>

<div class="container">

    <div>
        {#if imgUrl !== null} 
        <div>{selectedTitle}</div>
        <img 
            width="300" 
            height="300" 
            src={imgUrl} 
            alt="travel-img" 
        />
        {:else}
            <div>Загрузка картинки...</div>
        {/if}
    </div>
</div>