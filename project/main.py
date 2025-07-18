from kivy.app import App
from kivy.lang import Builder
from kivy.uix.boxlayout import BoxLayout
from kivy.clock import Clock

kv = """
BoxLayout:
    orientation: 'vertical'
    spacing: 20
    padding: 30

    Label:
        id: distance_label
        text: "Distance: -- km"
        font_size: 32

    Label:
        id: time_label
        text: "Time: --:--"
        font_size: 28

    BoxLayout:
        orientation: 'vertical'
        spacing: 10
        Label:
            text: "Initial Distance (km):"
        TextInput:
            id: distance_input
            input_filter: 'float'
            multiline: False
            font_size: 24

    BoxLayout:
        orientation: 'vertical'
        spacing: 10
        Label:
            text: "Speed (km/h):"
        TextInput:
            id: speed_input
            input_filter: 'float'
            multiline: False
            font_size: 24
"""

class TravelLayout(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.total_distance = 0
        self.remaining_distance = 0
        self.speed = 0
        self.bind_children()
        Clock.schedule_interval(self.update, 1)

    def bind_children(self):
        Clock.schedule_once(lambda dt: self.read_inputs(), 1)

    def read_inputs(self):
        try:
            self.total_distance = float(self.ids.distance_input.text)
            self.remaining_distance = self.total_distance
        except:
            self.remaining_distance = 0
        try:
            self.speed = float(self.ids.speed_input.text)
        except:
            self.speed = 0

    def update(self, dt):
        self.read_inputs()
        if self.speed > 0 and self.remaining_distance > 0:
            distance_per_sec = self.speed / 3600
            self.remaining_distance -= distance_per_sec
            if self.remaining_distance < 0:
                self.remaining_distance = 0

        time_remaining = self.remaining_distance / self.speed * 3600 if self.speed > 0 else 0
        minutes, seconds = divmod(int(time_remaining), 60)

        self.ids.distance_label.text = f"Distance: {self.remaining_distance:.1f} km"
        self.ids.time_label.text = f"Time: {minutes}:{seconds:02d}"

class DistanceApp(App):
    def build(self):
        self.title = "DistanceTrainer"
        return Builder.load_string(kv)

if __name__ == '__main__':
    DistanceApp().run()
