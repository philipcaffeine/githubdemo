class Customer:
    def __init__(self, name):
        self.name = name

    def send_sync_message(self, bank):
        print(f"{self.name} sends a synchronous message to {bank.name}")

    def send_async_message(self, bank):
        print(f"{self.name} sends an asynchronous message to {bank.name}")

    def self_message(self):
        print(f"{self.name} sends a self message")

    def receive_reply_message(self, bank):
        print(f"{self.name} receives a reply message from {bank.name}")


class Bank:
    def __init__(self, name):
        self.name = name

    def create_participant(self, insurance_agent):
        print(f"{self.name} creates participant {insurance_agent.name}")

    def delete_participant(self, insurance_agent):
        print(f"{self.name} deletes participant {insurance_agent.name}")


class InsuranceAgent:
    def __init__(self, name):
        self.name = name


# Example usage
customer = Customer("Customer")
bank = Bank("Bank")
insurance_agent = InsuranceAgent("Insurance Agent")

customer.send_sync_message(bank)
customer.send_async_message(bank)
bank.create_participant(insurance_agent)
bank.delete_participant(insurance_agent)
customer.self_message()
customer.receive_reply_message(bank)