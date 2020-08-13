<template>
    <div>
        <navigation-bar />
        <h1 class="header">ABOUT</h1>
        <div class="d-flex justify-content-start flex-column">
            <h3>Michaela</h3>
            <h3>Blake</h3>
            <h3>Luke</h3>
            <h3>Jon</h3>
        </div>
    </div>
</template>

<script>
import NavigationBar from '@/components/NavigationBar.vue';

export default {
    components: {
        NavigationBar
    }
};
</script>

<style>
template {
    background-image: none;
}
    h3 {
        margin-right: 70vh;
    }
</style>