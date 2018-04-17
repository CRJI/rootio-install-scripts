from pathlib import Path
root = Path(__file__).resolve().parent.parent
SQLALCHEMY_DATABASE_URI = 'postgres:///rootio'
ROOTIO_WEB_PATH = str(root.parent / 'rootio_web')
ESL_SERVER = '127.0.0.1'
