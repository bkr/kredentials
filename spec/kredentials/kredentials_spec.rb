require 'spec_helper'

class TestConfig
  extend Kredentials
  @@test = {:key => 'test'}
end

class TestDefaultConfig
  extend Kredentials
  @@defaults = {:key => 'default'}
  @@production = {:key => 'production'}
  @@staging = {:key => 'staging'}
end

class TestNoStagingConfig
  extend Kredentials
  @@development = {:key => 'development'}
  @@production = {:key => 'production'}
end

describe "kredentials" do
  describe "test" do
    before do
      if !defined?(Rails)
        class Rails
        end
        Rails.stub(:env).and_return("test")
      end    
    end
  
    it "should have test key" do
      TestConfig.key.should == "test"
    end
  end
  
  describe "default credentials for staging w/o defaults set or staging set" do
    before do
      TestNoStagingConfig.config_env = 'staging'
    end
    
    it "should have development key" do
      TestNoStagingConfig.key.should == "development"
    end
  end
  
  describe "default credentials" do
    
    describe "production" do
      before do
        TestDefaultConfig.config_env = 'production'
      end
      
      it "should be production" do
        TestDefaultConfig.key.should == 'production'
      end
    end
    
    describe "staging" do
      before do
        TestDefaultConfig.config_env = 'staging'
      end
      
      it "should be staging" do
        TestDefaultConfig.key.should == 'staging'
      end
    end
    
    describe "test" do
      before do
        TestDefaultConfig.config_env = 'test'
      end
      
      it "should be default" do
        TestDefaultConfig.key.should == 'default'
      end
    end
    
    describe "development" do
      before do
        TestDefaultConfig.config_env = 'development'
      end
      
      it "should be development" do
        TestDefaultConfig.key.should == 'default'
      end
    end
  end
  
  describe "test to hash" do
    describe "production" do
      before do
        TestDefaultConfig.config_env = 'production'
      end
      
      it "should be production" do
        TestDefaultConfig.to_hash['key'].should == 'production'
        TestDefaultConfig.to_hash[:key].should == 'production'
      end
    end
    describe "staging" do
      before do
        TestDefaultConfig.config_env = 'staging'
      end
      
      it "should be production" do
        TestDefaultConfig.to_hash['key'].should == 'staging'
        TestDefaultConfig.to_hash[:key].should == 'staging'
      end
    end
    describe "test" do
      before do
        TestDefaultConfig.config_env = 'test'
      end
      
      it "should be production" do
        TestDefaultConfig.to_hash['key'].should == 'default'
        TestDefaultConfig.to_hash[:key].should == 'default'
      end
    end
    describe "development" do
      before do
        TestDefaultConfig.config_env = 'development'
      end
      
      it "should be production" do
        TestDefaultConfig.to_hash['key'].should == 'default'
        TestDefaultConfig.to_hash[:key].should == 'default'
      end
    end
  end
end
