from pymongo import MongoClient
from robot.api.deco import keyword

client = MongoClient('mongodb+srv://qax:xperience@cluster0.hk0v2.mongodb.net/markX?retryWrites=true&w=majority&appName=Cluster0')

db = client['markX']

@keyword('Remove task from database')
def remove_task_by_name(task_name):
    collection = db['tasks']
    collection.delete_many({'text':task_name})
    print('Removendo a tarefa' + task_name)