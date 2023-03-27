function ShowProduct({product, productId}){
    console.log(product.filter(tile => tile.id === productId).map(tile => tile))

    return(
        <div className="modal fade" id='tileModal' tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div className="modal-dialog modal-lg">
                <div className="modal-content">
        {product
        .filter(tile => tile.id === productId)
        .map(tile => {
            return(
                <>
                    <div className="modal-header" key={tile.id}>
                        <h1 className="modal-title fs-5" id="exampleModalLabel">{tile.name}</h1>
                        <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div className="modal-body">
                        ...
                    </div>
                    <div className="modal-footer">
                        <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" className="btn btn-primary">Save changes</button>
                    </div>
                </>
            )
        })}
                </div>
            </div>
        </div>
    )
}

export default ShowProduct;