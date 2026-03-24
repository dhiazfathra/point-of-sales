import { ref, computed } from 'vue';

class CounterStore {
  private _count = ref(0);

  get count() {
    return this._count.value;
  }

  set count(value: number) {
    this._count.value = value;
  }

  get doubled() {
    return computed(() => this._count.value * 2);
  }

  increment() {
    this._count.value++;
  }

  decrement() {
    this._count.value--;
  }

  reset() {
    this._count.value = 0;
  }
}

export const counterStore = new CounterStore();
