

# Yet Another Todo App written using VIPER + Promises.

### Functionality
This just basically lists todos. If the todos are not found locally (first launch, etc), it checks the API for the todos and caches them. Current persistence
method is Core Data, but the code is abstract enough that any other can be substituted later on, using Realm, etc perhaps.

### Todo
1. Allow user to add new Todos
2. Allow user to edit/delete Todos
3. Allow user to mark a todo as done


### VIPER refresher
1. **View**: all view related code. Actual `view`'s are implemented using storyboard scenes/xibs.
2. **Presenter**: takes care of both event handling (receives input from user via the view) and presentation of data/content.
3. **Interactor**: the module's business logic belongs here.
4. **Wireframe/Router**: responsible for preparing a module, navigating to other modules
5. **LocalDataManager**: responsible for retrieval and persistence of data on the device
6. **RemoteDataManager**: responsible for interacting with a remote API.


### VIPER notes

1. To see how the different components within a module communicates with each other, check the respective `Protocols.swift`
2. Each module's entry point is done via the respective `Wireframe` classes.
3. Instead of including an additional protocols for the datamanager -> interactor flow , I opted to use promises (provided by `Hydra`).
4. We don't like segues here so scenes in the storyboards should basically be "unhooked." In a real app, we'll be using multiple storyboards per epic, and divide them as necessary to allow more simultaneous work by multiple developers.


### App-specific notes
1. This connects to a simple API in heroku. Not all endpoints are supported here so far.
2. I normally sort files alphabetically in folders but I intentionally didn't in the modules; instead i listed them according to how a developer would probably inspect/work on each module.



