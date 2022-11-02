require "rack/test"
require_relative '../../app'

def reset_spaces_table
    seed_sql = File.read('spec/seeds/spaces_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })
    connection.exec(seed_sql)
end
  
describe Application do
    # This is so we can use rack-test helper methods.
    include Rack::Test::Methods
  
    # We need to declare the `app` value by instantiating the Application
    # class so our tests work.
    let(:app) { Application.new }
  
    before(:each) do 
      reset_spaces_table
    end
  
    context "GET /" do
      it 'returns 200 OK' do
        response = get('/')
        expect(response.status).to eq(200)
      end
    end

    context "GET /spaces" do
        it 'returns a list of spaces' do
            response = get('/spaces')
            expect(response.status).to eq(200)
            expect(response.body).to include('Batcave')
        end
    end

    context "POST /spaces" do
        it 'adds a new space' do
            response = post('/spaces', name:'Island')
            expect(response.status).to eq(200)
            expect(response.body).to include('Your Space has been sucessfully added!')
            
            response = get('/spaces')
            expect(response.status).to eq(200)
            expect(response.body).to include('Island')
        end
    end


end