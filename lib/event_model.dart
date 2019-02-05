class Event {
  final String eventName;
  final String eventDate;
  final String eventTime;
  final String eventType;
  // All dogs start out at 10, because they're good dogs.
  int rating = 10;

  Event(this.eventName, this.eventDate, this.eventTime, this.eventType);
}