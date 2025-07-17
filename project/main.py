from kivy.app import App
from kivy.uix.label import Label

class TravelSimulatorApp(App):
    def build(self):
        return Label(text="Добро пожаловать в Travel Simulator!")

if __name__ == "__main__":
    TravelSimulatorApp().run()
