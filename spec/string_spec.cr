require "./spec_helper"

describe "String" do
  it "gives the tally method" do
    the_string = "whatever"
    expected_result = {"w" => 1, "h" => 1, "a" => 1, "t" => 1, "e" => 2, "v" => 1, "r" => 1}
    the_string.tally.should eq expected_result
  end
end
