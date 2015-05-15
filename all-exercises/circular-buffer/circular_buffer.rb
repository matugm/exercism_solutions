
class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @size   = size
    @buffer = []
  end

  def read
    raise BufferEmptyException if empty?
    @buffer.shift
  end

  def clear
    @buffer.clear
  end

  def write(data)
    return if data.nil?
    raise BufferFullException if full?

    @buffer << data
  end

  def empty?
    @buffer.empty?
  end

  def full?
    @buffer.size >= @size
  end

  def write!(data)
    return if data.nil?

    read if full?
    write data
  end
end
