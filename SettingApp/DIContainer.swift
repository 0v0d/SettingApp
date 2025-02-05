final class DIContainer {
    static let shared = DIContainer()
    
    private var dependencies: [DIKey: Any] = [:]
    private let lock = DispatchQueue(label: "com.di.container.lock")
    
    private init() {}
    
    func register<T>(
        _ type: T.Type,
        impl: T
    ) {
        let dependencyKey = DIKey( type)
        
        lock.sync {
            if dependencies[dependencyKey] == nil {
                dependencies[dependencyKey] = impl
            } else {
                fatalError(DIError.alreadyRegistered(type).localizedDescription)
            }
        }
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        let dependencyKey = DIKey(type)
        
        return lock.sync {
            guard let dependency = dependencies[dependencyKey] as? T else {
                fatalError(DIError.notRegistered(type).localizedDescription)
            }
            return dependency
        }
    }
}