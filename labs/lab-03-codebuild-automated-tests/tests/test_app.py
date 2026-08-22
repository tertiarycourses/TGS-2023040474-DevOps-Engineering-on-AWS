from app.version import greeting, VERSION


def test_greeting():
    assert greeting() == "Hello from the DevOps sample app"


def test_version():
    assert VERSION.count('.') == 2
