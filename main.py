from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.clock import Clock

class TravelSimulator(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.distance = 0
        self.speed = 0
        self.running = False

    def start(self):
        try:
            self.distance = float(self.ids.distance_input.text)
            self.speed = float(self.ids.speed_input.text)
            if self.distance <= 0 or self.speed <= 0:
                raise ValueError
        except ValueError:
            self.ids.distance_label.text = "Ошибка: Введите корректные значения"
            return

        self.running = True
        Clock.schedule_interval(self.update, 1)

    def update(self, dt):
        if not self.running or self.distance <= 0:
            self.ids.distance_label.text = "Вы прибыли!"
            self.ids.time_label.text = "Время прибытия: 0 ч"
            return False

        traveled = self.speed / 3600
        self.distance = max(0, self.distance - traveled)

        self.ids.distance_label.text = f"Оставшееся расстояние: {self.distance:.2f} км"
        if self.speed > 0:
            time_left = self.distance / self.speed
            self.ids.time_label.text = f"Оставшееся время: {time_left:.2f} ч"

    def update_speed(self):
        try:
            new_speed = float(self.ids.speed_input.text)
            if new_speed <= 0:
                raise ValueError
            self.speed = new_speed
        except ValueError:
            self.ids.time_label.text = "Ошибка: некорректная скорость"

class TravelApp(App):
    def build(self):
        return TravelSimulator()

if __name__ == "__main__":
    TravelApp().run()
