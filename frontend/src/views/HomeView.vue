<template>
  <div class="home">
    <h1>Point of Sales</h1>
    <div class="counter">
      <p>Counter:</p>
      <p class="count">{{ counterStore.count }}</p>
      <p class="doubled">Doubled: {{ counterStore.doubled.value }}</p>
    </div>
    <div class="controls">
      <button @click="counterStore.decrement()">-</button>
      <button @click="counterStore.increment()">+</button>
      <button @click="counterStore.reset()">Reset</button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { counterStore } from '../stores/counter';
</script>

<style scoped>
.home {
  text-align: center;
  padding: 2rem;
}

.counter {
  margin: 2rem 0;
}

.count {
  font-size: 3rem;
  font-weight: bold;
}

.doubled {
  color: #666;
  margin-top: 0.5rem;
}

.controls {
  display: flex;
  gap: 1rem;
  justify-content: center;
}

button {
  padding: 0.5rem 1.5rem;
  font-size: 1.2rem;
  cursor: pointer;
  border: 1px solid #ccc;
  border-radius: 4px;
  background: white;
  transition: background 0.2s;
}

button:hover {
  background: #f0f0f0;
}
</style>
