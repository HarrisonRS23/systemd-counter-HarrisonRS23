from datetime import date, datetime, timedelta
import io
import pytest
from counter import open_file, output

@pytest.fixture
def mock_open_file(monkeypatch):
    # Mock open_file function
    def mock_open_file():
        return io.StringIO()
    monkeypatch.setattr('counter.open_file', mock_open_file)
    
def test_output():
    # Test output function
    mock_out_file = io.StringIO()
    counter = 1
    output(counter, mock_out_file)
    now = datetime.now()
    one_second_ago = now + timedelta(seconds=1)
    # one_second_ago = now
    assert mock_out_file.getvalue().strip() == "Harrison: " + str(date.today()) + " " + one_second_ago.strftime("%H:%M:%S") + " #" + str(counter)

def test_open_file():
    # Test that open_file returns a file object
    out_file = open_file()
    assert isinstance(out_file, io.TextIOWrapper)
