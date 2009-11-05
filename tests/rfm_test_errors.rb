require 'test/unit'
require '../lib/rfm'

# Test cases for testing the FileMakerError classes 
#    
# Author::    Mufaddal Khumri
# Copyright:: Copyright (c) 2007 Six Fried Rice, LLC and Mufaddal Khumri
# License::   See MIT-LICENSE for details
class TC_TestErrors < Test::Unit::TestCase

  def test_default_message_system_errors
    begin
      raise Rfm::Error::FileMakerError.getError(0)
    rescue Rfm::Error::SystemError => ex
      assert_equal(ex.message, 'SystemError occurred.')
      assert_equal(ex.code, 0)
    end
  end  

  def test_scriptmissing_errors
    begin
      raise Rfm::Error::FileMakerError.getError(104, 'ScriptMissingError occurred.')
    rescue Rfm::Error::MissingError => ex
      assert_equal(ex.code, 104)
    end
  end  

  def test_rangevalidation_errors
    begin
      raise Rfm::Error::FileMakerError.getError(503, 'RangeValidationError occurred.')
    rescue Rfm::Error::ValidationError => ex
      assert_equal(ex.code, 503)
    end
  end  

  def test_one_unknown_errors
    begin
      raise Rfm::Error::FileMakerError.getError(-1, 'UnknownError occurred.')
    rescue Rfm::Error::UnknownError => ex
      assert_equal(ex.code, -1)
    end
  end  

  def test_two_unknown_errors
    begin
      raise Rfm::Error::FileMakerError.getError(99999, 'UnknownError occurred.')
    rescue Rfm::Error::UnknownError => ex
      assert_equal(ex.code, 99999)
    end
  end  
  
end

